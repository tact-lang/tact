struct WithOptional {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    s: WithOptional = WithOptional{ a: null, b: null };
}
