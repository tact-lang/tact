struct OptionalExample {
    maybeValue: Int?;
}

contract TestOptional {
    state: OptionalExample = OptionalExample { maybeValue: null };
    
    receive() {}
    
    get fun getOptional(): OptionalExample {
         return self.state;
    }
}
