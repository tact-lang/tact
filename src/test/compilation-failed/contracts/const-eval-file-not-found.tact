

contract ConstEvalFileNotFound {
    const NOTFOUND_FILE_STRING: String = readFile("./notfound-file.bob", "utf-8");
}
