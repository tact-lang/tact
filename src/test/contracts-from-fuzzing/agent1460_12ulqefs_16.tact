struct SerializedOptionals {
    one: Int? as uint8;
    two: Int? as int64;
    three: Int? as uint32;
    four: Int? as int257;
}

contract TestContract {
    data: SerializedOptionals;

    init() {
        self.data = SerializedOptionals{ one:null, two:null, three:null, four:4 };
    }
}