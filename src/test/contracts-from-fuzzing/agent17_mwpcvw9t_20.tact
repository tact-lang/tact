struct Inner {
    optionalVal: Int?;
}

contract NullNestedInit {
    innerVal: Inner = Inner{optionalVal: null};
}