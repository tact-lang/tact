struct Complex {
    intVal: Int;
    boolOpt: Bool?;
    sOpt: Sub?
}

struct Sub {
    flag: Bool;
    number: Int;
}

contract ComplexLayout {
    content: Complex;

    init() {
        self.content = Complex{
            intVal: 1,
            boolOpt: true,
            sOpt: Sub{flag:true, number:42}
        };
    }
}