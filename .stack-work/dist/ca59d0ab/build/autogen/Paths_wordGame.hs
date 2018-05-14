{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_wordGame (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\bin"
libdir     = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\lib\\x86_64-windows-ghc-8.0.2\\wordGame-0.1.0.0-Ht2VxeBEw2A5H5gLSwfVZ"
dynlibdir  = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\share\\x86_64-windows-ghc-8.0.2\\wordGame-0.1.0.0"
libexecdir = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\libexec"
sysconfdir = "E:\\code\\Haskell\\wordGame\\.stack-work\\install\\6c953ab2\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "wordGame_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wordGame_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "wordGame_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "wordGame_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wordGame_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "wordGame_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
