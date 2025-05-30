struct MultiOpt {
    a: Int?;         // implicit null default
    b: Bool?;        // implicit null default
    c: String?;      // implicit null default
    d: Address?;     // implicit null default
    e: Cell? = null; // explicit
}

contract MixedDefaultsOptional {
    s: MultiOpt = MultiOpt{ a:null, b:null, c:null, d:null, e:null };

    init() {}
}