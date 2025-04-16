contract OnlyStringsFixed {
    hello: String = "hello";
    world: String = "world";
    receive() {
        // Instead of +, use emit as concatenation isn't allowed
        emit(self.hello.asComment());
        emit(self.world.asComment());
    }
}