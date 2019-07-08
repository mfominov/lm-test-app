# vi:syntax=yaml
# vi:filetype=yaml

{{- define "api_resources" }}
resources:
  requests:
    cpu: {{ first (pluck .Values.global.env .Values.resources.api.requests.cpu) | default .Values.resources.api.requests.cpu._default | quote }}
    memory: {{ first (pluck .Values.global.env .Values.resources.api.requests.memory) | default .Values.resources.api.requests.memory._default | quote }}
  limits:
    cpu: {{ first (pluck .Values.global.env .Values.resources.api.limits.cpu) | default .Values.resources.api.limits.cpu._default | quote }}
    memory: {{ first (pluck .Values.global.env .Values.resources.api.limits.memory) | default .Values.resources.api.limits.memory._default | quote }}
{{- end }}