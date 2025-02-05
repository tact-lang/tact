trait OverrideBaseTraitConstantWithVirtual with BaseTrait {
    override virtual const storageReserve: Int = 100;
}

trait OverrideOverridden with OverrideBaseTraitConstantWithVirtual {
    override const storageReserve: Int = 10000;
}

contract TraitsConstantContract with OverrideOverridden {
    receive() {
        // deploy
    }

    get fun constant(): Int {
        return self.storageReserve;
    }
}
