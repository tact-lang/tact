struct InnerOptional {
    value: Int?;
}

contract OptionalStructField {
    my_field: InnerOptional = InnerOptional{ value: null };
}