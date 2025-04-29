/**
 * Allowed chars are `a-zA-Z0-9_`, must not begin with digit or underscore and must not end with underscore.
 */
export type VariableName = string
/**
 * Representation of stack entry or group of stack entries
 */
export type StackEntry =
    | {
          type: "simple"
          name: VariableName
          value_types?: PossibleValueTypes
          mutations?: Mutation[]
      }
    | {
          type: "const"
          value_type: ConstantType
          value: ConstantValue
      }
    | {
          type: "conditional"
          name: VariableName1
          match: MatchArm[]
          else?: StackValues
      }
    | {
          type: "array"
          name: VariableName
          length_var: VariableName2
          array_entry: ArraySingleEntryDefinition
      }
export type PossibleValueTypes = (
    | "Integer"
    | "Bool"
    | "Cell"
    | "Builder"
    | "Slice"
    | "Tuple"
    | "Continuation"
    | "Null"
)[]
export type ConstantType = "Integer" | "Null"
export type ConstantValue = number | null
/**
 * Allowed chars are `a-zA-Z0-9_`, must not begin with digit or underscore and must not end with underscore.
 */
export type VariableName1 = string
export type ArmValue = number
/**
 * Allowed chars are `a-zA-Z0-9_`, must not begin with digit or underscore and must not end with underscore.
 */
export type VariableName2 = string
/**
 * Array is a structure like `x1 y1 z1 x2 y2 z2 ... x_n y_n z_n n` which contains `n` entries of `x_i y_i z_i`. This property defines the structure of a single entry.
 */
export type ArraySingleEntryDefinition = StackValues
/**
 * Stack constraints. Top of stack is the last value.
 */
export type StackValues = StackEntry[]
/**
 * Represents read/write access to a register
 */
export type Register =
    | {
          type: "constant"
          index: number
      }
    | {
          type: "variable"
          var_name: VariableName
      }
    | {
          type: "special"
          name: "gas" | "cstate" | "r"
      }
export type RegisterValues = Register[]
/**
 * Description of a continuation with static savelist
 */
export type Continuation =
    | {
          type: "cc"
          save?: ContinuationSavelist
      }
    | {
          type: "variable"
          var_name: VariableName3
          save?: ContinuationSavelist
      }
    | {
          type: "register"
          index: RegisterNumber03
          save?: ContinuationSavelist
      }
    | {
          type: "special"
          name: "until"
          args: {
              body: Continuation
              after: Continuation
          }
      }
    | {
          type: "special"
          name: "while"
          args: {
              cond: Continuation
              body: Continuation
              after: Continuation
          }
      }
    | {
          type: "special"
          name: "again"
          args: {
              body: Continuation
          }
      }
    | {
          type: "special"
          name: "repeat"
          args: {
              count: VariableName4
              body: Continuation
              after: Continuation
          }
      }
    | {
          type: "special"
          name: "pushint"
          args: {
              value: IntegerToPushToStack
              next: Continuation
          }
      }
/**
 * Allowed chars are `a-zA-Z0-9_`, must not begin with digit or underscore and must not end with underscore.
 */
export type VariableName3 = string
export type RegisterNumber03 = number
/**
 * Allowed chars are `a-zA-Z0-9_`, must not begin with digit or underscore and must not end with underscore.
 */
export type VariableName4 = string
export type IntegerToPushToStack = number

export type Mutation = {
    length: {
        amount_arg?: number
        stack_amount_arg?: number
    }
}

export type Schema = Record<string, InstructionSignature>

/**
 * Information related to usage of stack and registers by instruction.
 */
export interface InstructionSignature {
    inputs?: InstructionInputs
    outputs?: InstructionOutputs
}
/**
 * Incoming values constraints.
 */
export interface InstructionInputs {
    stack?: StackValues
    registers: RegisterValues
}
export interface MatchArm {
    value: ArmValue
    stack: StackValues
}
/**
 * Outgoing values constraints.
 */
export interface InstructionOutputs {
    stack?: StackValues
    registers: RegisterValues
}
/**
 * Values of saved control flow registers c0-c3
 */
export interface ContinuationSavelist {
    c0?: Continuation
    c1?: Continuation
    c2?: Continuation
    c3?: Continuation
}
