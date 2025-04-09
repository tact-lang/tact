struct SOptional {
    val: Int?;
}

contract TestContract {
    v1: SOptional = SOptional{ val:null };
    v2: SOptional = SOptional{ val:123 };
}