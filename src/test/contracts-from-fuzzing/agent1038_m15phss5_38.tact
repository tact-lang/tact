struct Mixed {
    plain: Int;
    opt: Int?;
    plain2: Bool;
}

contract MixedOrder {
    dat: Mixed = Mixed{
        plain: 1,
        opt: null,
        plain2: true
    };
    init() {}
}