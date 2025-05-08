struct Tiny {
    x: Int;
}

struct TinyHolder {
    optTiny: Tiny?;
}

contract OptStructInField {
    val: TinyHolder;

    init() {
        self.val = TinyHolder{
            optTiny: null
        };
    }
}