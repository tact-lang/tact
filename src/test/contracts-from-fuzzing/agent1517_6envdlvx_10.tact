struct Profile { name: String; age: Int; }

contract OptionalWholeStruct {
    info: Profile?;
    init() {
        self.info = null;
    }
}