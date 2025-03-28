/// Thrown when the sender is not the owner of the contract.
///
/// See: https://docs.tact-lang.org/book/exit-codes#132
///
const AccessDenied: Int = 132;

/// Thrown when a message has been send to a contract which inherits the `Stoppable`
/// trait and has the `self.stopped` flag set to `true`.
///
/// See: https://docs.tact-lang.org/book/exit-codes#133
///
const ContractStopped: Int = 133;

/// Thrown when an invalid argument is passed to a function or method.
///
/// See: https://docs.tact-lang.org/book/exit-codes#134
///
const InvalidArgument: Int = 134; // Invalid argument —  text.tact

/// Thrown when the code for a contract is missing or cannot be located.
///
/// See: https://docs.tact-lang.org/book/exit-codes#135
///
const ContractCodeNotFound: Int = 135;

/// Thrown when an address does not conform to the expected standard format.
///
/// See: https://docs.tact-lang.org/book/exit-codes#136
///
const InvalidStandardAddress: Int = 136;
