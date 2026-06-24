struct Named {
    name: String = "Bob";
}

contract NamedInner {
    person: Named = Named{};
}
