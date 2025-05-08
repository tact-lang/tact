struct Cat { meow: Int; }

contract TestStructExpressions {
    fun showcase() {
        // Testing struct instantiation and field access via expressions:
        let cat = Cat{ meow: 100 };
        dump(cat.meow);
    }

    receive() {
        self.showcase();
    }
}
