struct HasOptional {
    i: Int?;
}

contract StructWithOptional {
    h: HasOptional = HasOptional{
        i: null,
    };

    receive() {}
}