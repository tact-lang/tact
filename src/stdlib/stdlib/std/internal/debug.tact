// these are builtin functions, these get special treatment from FunC
// hence, no asm here

/// **Deprecated** global function: use `throw` instead.
///
/// Unconditionally throws an exception with an error code equal to `code`. 
///
/// ```tact
/// receive() {
///     // Throw exit code 1024 if the empty message is received
///     nativeThrow(1024);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrowunless
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw)
native nativeThrow(code: Int);

/// Global function.
///
/// Unconditionally throws an exception with an error code equal to `code`. 
///
/// ```tact
/// receive() {
///     // Throw exit code 1024 if the empty message is received
///     throw(1024);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw)
native throw(code: Int);

/// **Deprecated** global function: use `throwIf` instead.
///
/// Throws an exception with an error code equal to `code` if `condition` holds. 
///
/// ```tact
/// receive() {
///     // Check the sender is the owner of the contract
///     // Throw exit code 1024 if the condition is not met
///     nativeThrowIf(1024, sender() != self.owner);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrowif
/// * https://docs.tact-lang.org/ref/core-debug/#throwif
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw_if)
native nativeThrowIf(code: Int, condition: Bool);

/// Global function.
///
/// Throws an exception with an error code equal to `code` if `condition` holds. 
///
/// ```tact
/// receive() {
///     // Check the sender is the owner of the contract
///     // Throw exit code 1024 if the condition is not met
///     throwIf(1024, sender() != self.owner);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwif
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw_if)
native throwIf(code: Int, condition: Bool);

/// **Deprecated** global function: use `throwUnless` instead.
///
/// Throws an exception with an error code equal to `code` if `condition` does not hold. 
/// Behaves like `require` but takes an explicit error code.
///
/// ```tact
/// receive() {
///     // Check the sender is the owner of the contract
///     // Throw exit code 1024 if the condition is not met
///     nativeThrowUnless(1024, sender() == self.owner);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#nativethrowunless
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw_unless)
native nativeThrowUnless(code: Int, condition: Bool);

/// Global function.
///
/// Throws an exception with an error code equal to `code` if `condition` does not hold. 
/// Behaves like `require` but takes an explicit error code.
///
/// ```tact
/// receive() {
///     // Check the sender is the owner of the contract
///     // Throw exit code 1024 if the condition is not met
///     throwUnless(1024, sender() == self.owner);
/// }
/// ```
///
/// See:
/// * https://docs.tact-lang.org/ref/core-debug/#throwunless
/// * https://docs.tact-lang.org/ref/core-debug
///
@name(throw_unless)
native throwUnless(code: Int, condition: Bool);
