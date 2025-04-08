contract NullablePrimitives {
    description: String?;
    tag: String?;
    published: Bool?;
    active: Bool?;

    init() {
        // leave fields unassigned, should default to null
    }
}