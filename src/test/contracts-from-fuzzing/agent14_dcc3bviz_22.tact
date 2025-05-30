contract TestExternal {
    external("greetings") {
        // This external receiver should be triggered on off-chain messages with voice "greetings"
    }
}
