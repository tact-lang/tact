contract Test {
    // Test external receiver function: external keyword, with a specific text comment
    external("externalHello") {
        acceptMessage();
    }
}
