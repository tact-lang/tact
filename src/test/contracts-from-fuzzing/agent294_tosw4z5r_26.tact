message(51) Innermsg {
    x: Int? = 10;
}

struct Wrapper {
    m: Innermsg? = null;
}

contract OvOpt {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            m: Innermsg{
                x: 42
            }
        };
    }
}
