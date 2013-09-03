#!/bin/bash

# Copied from http://help.eclipse.org/indigo/index.jsp?topic=%2Forg.eclipse.platform.doc.isv%2Fguide%2Fp2_publisher.html
#
# Features And Bundles Publisher
#
# The features and bundles publisher application (org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher)
# is a command line application that is capable of generating metadata (p2 repositories) from pre-built Eclipse
# bundles and features. The features and bundle publisher can be invoked using the generic Eclipse launcher format as follows:
#
# eclipse -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher <publisherArgs>
#
# Here are command-line options:
#
# -metadataRepository <URI>
#    the URI to the metadata repository where the installable units should be published
# -artifactRepository <URI>
#    the URI to the artifact repository where the artifacts should be published
# -source <path>
#    the location of the update site
# -bundles <path>
#    the location of the bundles
# -features <path>
#    the location of the features	
# -compress
#    a flag indicating that the repository should be compressed
# -append
#    flag indicating that repositories will be appended to as opposed to over-written
# -publishArtifacts
#   flag indicating that the artifacts should be published (copied) to the repository. When this flag is not set,
#   the actual bytes underlying the artifact will not be copied, but the repository index will be created. 
#   When this option is not specified, it is recommended to set the artifactRepository to be in the same location as the source (-source).
#
# The features and bundles publisher application can be invoked using the -source option by pointing at a directory that contains 
# two sub-directories (features and plug-ins). The publisher can also be invoked by pointing at the bundles and features separately and using the -bundles and -features options.
#
# Here is an example of how the features and bundles publisher can be used to create a compressed p2 repository from a collection of bundles and features:
#
# eclipse -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher
#    -metadataRepository file:/<some location>/repository
#    -artifactRepository file:/<some location>/repository
#    -source /<location with a plugin and feature directory>
#    -configs gtk.linux.x86
#    -compress
#    -publishArtifacts
#
#

DIRNAME=`dirname "$0"`
cd $DIRNAME
REPNAME="$PWD/repository"

rm -f $REPNAME/artifacts.* $REPNAME/content.*

java -jar $HOME/Applications/eclipse-3.7-rcp/plugins/org.eclipse.equinox.launcher_*.jar \
   -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
   -metadataRepository file:/$REPNAME \
   -artifactRepository file:/$REPNAME \
   -source $REPNAME \
   -configs gtk.linux.x86 \
   -compress

