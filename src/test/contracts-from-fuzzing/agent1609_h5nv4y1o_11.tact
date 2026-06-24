// optional deep nested struct used as single contract field
struct Param {
    foo: Int?;
    bar: Bool?;
    baz: String;
}

contract TestContract {
    param: Param?;

    init() {
        self.param = Param{
            foo: null,
            bar: true,
            baz: "hello"
        };
    }

    receive() {
        self.param = null;
    }
}