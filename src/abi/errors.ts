// Errors 0-127 are reserved for VM errors
// Errors 128-255 are reserved for contract errors
export const contractErrors = {
    null: { id: 128, message: "Null reference exception" },
    invalidPrefix: { id: 129, message: "Invalid serialization prefix" },
    invalidMessage: { id: 130, message: "Invalid incoming message" },
    constraintsError: { id: 131, message: "Constraints error" },
    accessDenied: { id: 132, message: "Access denied" },
    contractStopped: { id: 133, message: "Contract stopped" },
    invalidArgument: { id: 134, message: "Invalid argument" },
    codeNotFound: { id: 135, message: "Code of a contract was not found" },
    invalidStdAddress: { id: 136, message: "Invalid standard address" },
    // The ID 137 is deliberately skipped because that exit code was deprecated
    // and is only accessible in versions of Tact before 1.6.0
    notBasechainAddress: { id: 138, message: "Not a basechain address" },
};
