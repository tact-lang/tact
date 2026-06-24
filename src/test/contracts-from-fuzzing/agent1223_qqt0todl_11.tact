struct SemiOptional {
    a: Int = 5;
    b: String?;
    c: Bool = true;
}

contract PartialStructInit {
    data: SemiOptional = SemiOptional{
        a: 42,
    };
}