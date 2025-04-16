// optional nested struct with serialization in nested
struct File {
    id: Int as uint64;
    name: String;
}

struct Folder {
    file: File?;
}

contract OptSerStruct {
    data: Folder;
    init() {
        self.data = Folder{ file:null };
    }
}