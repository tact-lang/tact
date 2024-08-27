

contract ConstEvalFileNotFound {
    const NONFOUND_FILE_STRING: String = readFile("./nonfound-file.bob", "utf-8");
}
