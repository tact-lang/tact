@interface("") trait B {
}

trait C {  
    abstract get fun d(e: String): String;  
}

trait Ownable with B {
    owner: Address;
    value: Int;

    const someNum: Int = 2;

    receive("message") {

    }

    fun requireOwner() {
        nativeThrowUnless(132, context().sender == self.owner);
    }

    get fun owner(): Address {
        return self.owner;
    }
}

@interface("a") contract Treasure with Ownable {
    owner: Address;
    value: Int;

    init(owner: Address) {
        self.owner = owner;
        self.value = 1;
    }
}