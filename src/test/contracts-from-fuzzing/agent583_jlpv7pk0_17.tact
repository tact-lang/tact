message(42) Mfoo { value: Int }

struct Wrapper {
    inside: Mfoo?;
}

contract MsgInStructOpt {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inside: Mfoo{ value: 777 }
        };
    }
}