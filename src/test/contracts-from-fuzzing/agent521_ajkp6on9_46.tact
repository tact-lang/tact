struct DeepOptSized {
    foo: Int? as uint8;
    bar: Int as int16;
}

contract SuperNestedOpt {
    s: DeepOptSized? = null;

    receive() {
        self.s = DeepOptSized{
            foo: 255,
            bar: -1234,
        };
    }
}