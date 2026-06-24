message(11) MyMsg { foo: Int }

struct Wrapper {
    m: MyMsg?;
}

contract TestContract {
    wrap: Wrapper = Wrapper{ m: null };

    init() {
        self.wrap = Wrapper{
            m: MyMsg{ foo: 123 }
        };
    }
}