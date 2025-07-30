struct Opts {
    name: String?;
    owner: Address?;
}

contract Test {
    o: Opts = Opts{
        name: null,
        owner: null
    };
}