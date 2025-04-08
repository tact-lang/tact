struct Msg {
    a: Int;
}

trait InnerTrait {
    tfield: Msg;
}

contract TraitFieldTest with InnerTrait {
    tfield: Msg;
    init() {
        self.tfield = Msg{ a: 123 };
    }
}