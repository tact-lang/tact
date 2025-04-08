struct SmallOpt {
    i: Int?;
    s: String?;
}
contract OptDefaults {
    field: SmallOpt = SmallOpt{ i: null, s: null };
}