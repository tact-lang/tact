primitive Int;
trait BaseTrait {}

const MY_CONSTANT = 42;

trait MyTrait {
    const MY_CONSTANT = 42;
}

contract MyContract {
    const MY_CONSTANT = 42;
}

trait Treasure {
    virtual const ENABLE_TIMELOCK: Int = 1;

    receive("Execute") {
        if (self.ENABLE_TIMELOCK) {
            //
            // This branch would be removed at compile time if ENABLE_TIMELOCK is false
            //
        }
    }
}

struct Foo {
    foo: Int;
}

const f = Foo { foo: 1 };

contract MyContract1 with Treasure {
    override const ENABLE_TIMELOCK = 1;
}
