struct MultiDefaults {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract MultiDef {
    v: MultiDefaults = MultiDefaults{};
    b: Bool = true;
    s: String = "ok";
}