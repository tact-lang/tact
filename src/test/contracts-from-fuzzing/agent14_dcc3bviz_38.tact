contract TestExternalInvalidParam {
    // Attempt to declare an external receiver with a parameter type (String) should be rejected. External receivers must be declared with a fixed text literal only.
    external(str: String) {
        // Body
    }
}
