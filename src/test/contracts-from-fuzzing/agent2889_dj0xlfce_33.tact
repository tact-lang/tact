struct Inner { s: String; }

contract InlineInitStruct {
    i: Inner = Inner{ s: "str" };

    init() {
        self.i = Inner{ s: "bar" };
    }
}