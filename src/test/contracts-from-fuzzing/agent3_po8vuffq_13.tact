struct FuzzResults {
    sameSame: Bool;
    different: Bool;
    literalRound: Bool;
    dynamicChainComparison: Bool;
}

fun dynamicChainAddress(flag: Bool): Address {
    let chain: Int = flag ? 0 : -1;
    return newAddress(chain, 0xfeedface);
}

fun testAdvancedAddressFuzz(): FuzzResults {
    let addrA: Address = newAddress(0, 0xdeadbeef);
    let addrB: Address = newAddress(0, 0xdeadbeef);
    let sameSame: Bool = addrA == addrB; // expected: true

    let addrC: Address = newAddress(-1, 0xdeadbeef);
    let different: Bool = addrA != addrC; // expected: true

    let literal: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let literalRound: Bool = literal == literal.asSlice().asAddressUnsafe();

    let addrD: Address = dynamicChainAddress(true);  // uses workchain 0
    let addrE: Address = dynamicChainAddress(false); // uses workchain -1
    let dynamicChainComparison: Bool = addrD.toString() != addrE.toString();

    return FuzzResults{sameSame, different, literalRound, dynamicChainComparison};
}
