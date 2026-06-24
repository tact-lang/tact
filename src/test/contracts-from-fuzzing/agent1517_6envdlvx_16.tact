struct Inner { text: String; }

contract NullOptStruct {
    data: Inner?;
    init() {
        self.data = null;
    }
}