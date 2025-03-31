/// Thrown when a null reference exception occurs during the compute phase.
/// Configurable since Tact 1.6.
///
/// See: https://docs.tact-lang.org/book/exit-codes#128
///
const TactExitCodeNullReferenceException: Int = 128;

/// Thrown when an invalid serialization prefix is encountered.
///
/// See: https://docs.tact-lang.org/book/exit-codes#129
///
const TactExitCodeInvalidSerializationPrefix: Int = 129;

/// Thrown when there is no receiver for the opcode of the received message.
///
/// See: https://docs.tact-lang.org/book/exit-codes#130
///
const TactExitCodeInvalidIncomingMessage: Int = 130;

/// Reserved error code. Constraints error, but never thrown.
///
/// See: https://docs.tact-lang.org/book/exit-codes#131
///
const TactExitCodeConstraintsError: Int = 131;

/// Thrown when the sender is not the owner of the contract.
///
/// See: https://docs.tact-lang.org/book/exit-codes#132
///
const TactExitCodeAccessDenied: Int = 132;

/// Thrown when a message has been sent to a contract which inherits the `Stoppable`
/// trait and has the `self.stopped` flag set to `true`.
///
/// See: https://docs.tact-lang.org/book/exit-codes#133
///
const TactExitCodeContractStopped: Int = 133;

/// Thrown when an invalid argument is passed to a function or method.
///
/// See: https://docs.tact-lang.org/book/exit-codes#134
///
const TactExitCodeInvalidArgument: Int = 134;

/// Thrown when the code for a contract is missing or cannot be located.
///
/// See: https://docs.tact-lang.org/book/exit-codes#135
///
const TactExitCodeContractCodeNotFound: Int = 135;

/// Thrown when an address does not conform to the expected standard format.
///
/// See: https://docs.tact-lang.org/book/exit-codes#136
///
const TactExitCodeInvalidStandardAddress: Int = 136;

/// Thrown when the address is not a basechain address.
///
/// See: https://docs.tact-lang.org/book/exit-codes#138
///
const TactExitCodeNotBasechainAddress: Int = 138;
