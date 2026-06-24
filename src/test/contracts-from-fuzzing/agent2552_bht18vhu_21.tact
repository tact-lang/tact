struct ManyOptNulls {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;
    o4: Address? = null;
}

contract ExplicitNullDefaults {
    data: ManyOptNulls = ManyOptNulls{};
}