struct Contact {
    phone: String?;
    email: String?;
}

contract ParamOptionalStruct(
    info: Contact?,
) {}