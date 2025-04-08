struct Contact {
    email: String;
    phone: String?;
}

contract ParamsOptionalStruct(
    contact: Contact?,
) {}