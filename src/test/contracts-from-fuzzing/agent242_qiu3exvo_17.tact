struct ManyOptionalDefaults {
    a: Int?;
    b: Bool?;
    c: Int? = null;
    d: Bool? = false;
    e: Int? = 42;
    f: Bool? = true;
    g: Int?;
    h: Bool?;
 }

contract ManyOptionals {
    data: ManyOptionalDefaults = ManyOptionalDefaults{ a: null, b: null, g: null, h: null };
}