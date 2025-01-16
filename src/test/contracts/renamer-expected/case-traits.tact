@interface("") trait trait_0 {}

trait trait_1 {
    abstract get fun function_decl_2(e: String): String;
}

trait trait_3 with B {
    owner: Address;
    value: Int;

    const constant_def_4: Int = 2;
    abstract const constant_decl_5: Int;

    receive("message") {}

    fun function_def_6() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun function_def_7(): Address {
        return self.owner;
    }
}

@interface("a") contract contract_8 with Ownable {
    owner: Address;
    value: Int;

    const constant_def_4: Int = 2;

    init(owner: Address) {
        self.owner = owner;
        self.value = 1;
    }
}
