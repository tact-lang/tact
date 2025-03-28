/// [Null reference exception] — Thrown when a null reference is encountered during the compute phase.
/// Configurable since Tact 1.6.
const NullReferenceException: Int = 128;

/// [Invalid serialization prefix] — Thrown when the serialization prefix is incorrect.
const InvalidSerializationPrefix: Int = 129;

/// [Invalid incoming message] — Thrown when there is no receiver for the opcode of the received message.
const InvalidIncomingMessage: Int = 130;

/// [Constraints error] — Reserved error, currently never thrown.
const ConstraintsError: Int = 131;

/// [Access denied] — Thrown when the sender is not the owner of the contract.
const AccessDenied: Int = 132;

/// [Contract stopped] — Thrown when the contract has been halted and cannot process further messages.
const ContractStopped: Int = 133;

/// [Invalid argument] — Thrown when an invalid argument is passed to a function or method.
const InvalidArgument: Int = 134;

/// [Contract code not found] — Thrown when the code for a contract is missing or cannot be located.
const ContractCodeNotFound: Int = 135;

/// [Invalid standard address] — Thrown when an address does not conform to the expected standard format.
const InvalidStandardAddress: Int = 136;

/// [Masterchain not enabled] — Thrown when masterchain support is required but not enabled for this contract.
/// Removed since Tact 1.6.
const MasterchainNotEnabled: Int = 137;

/// [Not a basechain address] — Thrown when an address does not belong to the basechain.
const NotABasechainAddress: Int = 138;
