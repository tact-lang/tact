trait OverrideBaseTraitConstant with BaseTrait {
    override const storageReserve: Int = 100;
}

contract TraitsConstantContract with OverrideBaseTraitConstant {
    receive() {
        // deploy
    }

    get fun constant(): Int {
        return self.storageReserve;
    }
}
