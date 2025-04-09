contract SerialDefaults {
    a: Int as uint8 = 5;
    b: Int as int64 = -42;
    c: Int as coins = 1000000000;
    d: Int? as uint8 = null;
    e: Int? as int64 = null;
    f: Int? as coins = null;

    init() {
        // leave defaults
    }
}