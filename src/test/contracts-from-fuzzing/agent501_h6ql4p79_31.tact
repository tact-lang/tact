struct Alias {
    addr: Address;
}

struct AliasOpt {
    ref: Alias?;
}

contract AliasOptContract {
    field: AliasOpt;

    init() {
        self.field = AliasOpt{ ref: Alias{ addr: myAddress() } };
    }
}