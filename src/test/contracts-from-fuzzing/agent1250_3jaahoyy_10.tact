struct OptionalString {
    s: String?;
}

contract TestContract {
    os: OptionalString = OptionalString{s: null};
}