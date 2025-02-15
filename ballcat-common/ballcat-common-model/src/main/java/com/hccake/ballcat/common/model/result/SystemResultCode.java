package com.hccake.ballcat.common.model.result;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Hccake
 * @version 1.0
 * @date 2019/9/12 12:19
 */
@Getter
@AllArgsConstructor
public enum SystemResultCode implements ResultCode {

	// ================ 基础部分，参考 HttpStatus =============

	// region --- 2xx Success ---
	/**
	 * 成功
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.3.1">HTTP/1.1:
	 * Semantics and Content, section 6.3.1</a>
	 *
	 */
	SUCCESS(200, "Success"),
	// endregion

	// region --- 4xx Client Error ---

	/**
	 * 参数错误
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.5.1">HTTP/1.1:
	 * Semantics and Content, section 6.5.1</a>
	 */
	BAD_REQUEST(400, "Bad Request"),
	/**
	 * 未认证
	 * @see <a href="https://tools.ietf.org/html/rfc7235#section-3.1">HTTP/1.1:
	 * Authentication, section 3.1</a>
	 *
	 */
	UNAUTHORIZED(401, "Unauthorized"),
	/**
	 * 未授权
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.5.3">HTTP/1.1:
	 * Semantics and Content, section 6.5.3</a>
	 *
	 */
	FORBIDDEN(403, "Forbidden"),

	/**
	 * {@code 404 Not Found}.
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.5.4">HTTP/1.1:
	 * Semantics and Content, section 6.5.4</a>
	 */
	NOT_FOUND(404, "Not Found"),

	/**
	 * {@code 405 Method Not Allowed}.
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.5.5">HTTP/1.1:
	 * Semantics and Content, section 6.5.5</a>
	 */
	METHOD_NOT_ALLOWED(405, "Method Not Allowed"),

	// endregion

	// region --- 5xx Server Error ---

	/**
	 * 服务异常
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.6.1">HTTP/1.1:
	 * Semantics and Content, section 6.6.1</a>
	 */
	SERVER_ERROR(500, "Internal Server Error"),

	/**
	 * {@code 502 Bad Gateway}.
	 * @see <a href="https://tools.ietf.org/html/rfc7231#section-6.6.3">HTTP/1.1:
	 * Semantics and Content, section 6.6.3</a>
	 */
	BAD_GATEWAY(502, "Bad Gateway");

	// endregion

	private final Integer code;

	private final String message;

}
