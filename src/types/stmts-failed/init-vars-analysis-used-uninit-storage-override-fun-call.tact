primitive Int;
primitive Bool;

trait BaseTrait {
    
}

trait AbstractTrait {
    abstract fun execute(): Int;
}

contract Contract {
    value: Int;
    init(arg: Bool) {
        self.execute();
        self.value = 1;
    }

    override fun execute(): Int {
        self.value = self.value + 1;
        return self.value;
    }
}