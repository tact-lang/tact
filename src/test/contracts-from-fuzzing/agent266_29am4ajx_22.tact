struct HasConstants {
    foo: Int = 1;
    bar: Int = 2;
}

contract ConstInStruct {
    data: HasConstants;

    init() {
        self.data = HasConstants{
            foo: 10,
            bar: 20
        };
    }
}