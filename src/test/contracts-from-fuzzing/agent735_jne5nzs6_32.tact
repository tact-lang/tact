struct CoinsField {
    amount: Int? as coins;
}

contract OptionalStructParam( 
    nested: CoinsField?,
) {
    receive() {}
}
