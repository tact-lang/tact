struct WithOptional {
    field: Int?;
}

contract TestOptional {
    receive() {
        let s: WithOptional = WithOptional{ field: 42 };
    }
}
